#!/usr/bin/env nextflow
params.mode = 'cram'

// ##################### input readtable file 

cram_files_list = file(params.cram_list)

// Convert input manifest to a channel.

cram_params = Channel.fromPath(cram_files_list) \
        | splitCsv(header:true) \
        | map { row-> tuple(row.sampleId, file(row.cram)) }
                    

process Prep_fasta {
    tag "${sample_name}"

    publishDir "${params.outdir}/fasta_conv", mode:'copy'
    input:
    tuple val(sample_name),
            path(cram)

    output:
    tuple val(sample_name), 
        path("${sample_name}.fasta")
	
    script:

    """
    samtools consensus -@ 20 ${cram} > ${sample_name}.fasta
    """
   
}

process create_tsv {
    publishDir "${params.outdir}/tsv_output", mode: 'copy'

    input:
    tuple val(sample_name), path(fasta)

    output:
    path "${sample_name}.tsv"

    script:
    """
    fasta_path=\$(realpath ${fasta})
    echo -e "${sample_name}\t\${fasta_path}" > ${sample_name}.tsv
    """
}

process merge_tsv {
    publishDir "${params.outdir}/merge_tsv", mode: 'copy'

    input:
    path tsv_files

    output:
    path "merge_samples_output.tsv"

    script:
    """
    cat ${tsv_files} > merge_samples_output.tsv
    echo -e "Reference\t${params.ref}" >> merge_samples_output.tsv
    """
}

process Mini_cactus {
    publishDir "${params.outdir}/cactus_output", mode: 'copy', pattern: '*'

    input:
    path merge_samples_tsv

    output:
    path "${params.outdir}/cactus_output"

    script:
    """
  echo "Current directory: \$(pwd)"
    echo "Listing files in current directory:"
    ls -lh
    echo "Running cactus-pangenome..."
    which cactus-pangenome
    cactus-pangenome ws ${merge_samples_tsv} --outDir mini_cactus-pg --outName mini_cactus-pg --reference Reference --mapCores 25 --vcf --giraffe --gfa --gbz
    """
}

workflow {
    results = Prep_fasta(cram_params)
    tsv_files = create_tsv(results).collect() | view()
    merge_tsv(tsv_files)
    Mini_cactus(merge_tsv.out)

}