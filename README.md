# Workflows
This repository contains following workflows:
- [TogoVar Annotation CWL Script](#togovar-annotation-cwl-script)**`(Tools/AddTogoVarAnnotation.cwl)`:** This workflow adds the TGVID (TogoVar ID) to the INFO column of your VCF file.
- [Workflow for Mini Cactus](#workflow-for-mini-cactus)**`(germline-minicactus.nf)`:** This repository contains a Nextflow configuration file (nextflow.config) and a workflow script (germline-minicactus.nf) to process genomic data using Samtools, Cactus, and VG.

# TogoVar Annotation CWL Script
This repository contains a Common Workflow Language (CWL) script for annotating Variant Call Format (VCF) files using the TogoVar database. The script leverages bcftools to add TogoVar information to VCF files, enabling the integration of genetic variations into your genomic analysis.

## Inputs
- colname: (Optional) Specifies column names for the annotation file.
- annotationfile: A VCF file containing annotations to be added.
  - https://grch38.togovar.org/downloads/release/current/grch38/annotation/
  - Please also download the INDEX file（.tbi）.
  - The genomic coordinate is GRCH38.
- header: Header file for the VCF format.
  - https://grch38.togovar.org/downloads/release/current/grch38/annotation/scripts/annots.hdr
  - The tgvid in the hdr file is the variant ID assigned by TogoVar.
- vcf: The VCF file to be annotated.
- output_name: The desired name for the output file.

## Outputs

    outputfile: The annotated VCF file, with TogoVar information integrated.
## Usage
- To run this CWL script, ensure you have cwl-runner installed and Docker enabled, as it uses the biocontainers/bcftools Docker image.
- To run the workflow, use the following command:
```console
cwltool \
  "BioHackathonFiles2024/Tools/AddTogoVarAnnotation.cwl" \
  --annotationfile annotation.tsv.gz \
  --header annotation.hdr \
  --vcf target-vcf.vcf.gz
```

    
# Cactus Pangenome Graph Pipeline

This repository contains a Nextflow configuration file (config.config) and a workflow script (germline-minicactus.nf) to process genomic data using Samtools, Cactus, and VG.

## Usage

**Input:**
You need to prepare a list of input genomes in a CSV file. This file should include paths to the genome files and any associated metadata required by the pipeline.
Configuration File (config.config): This file sets up the necessary parameters for the pipeline, including the path to the single reference genome, CPU, memory specifications, and other environment settings.

```
sampleId,cram
SP01,path/to/sample/cram/S1.cram
SP02,path/to/sample/cram/S2.cram
```


The pipeline is executed using the Nextflow workflow manager. It aligns the input genomes against the single reference genome to construct a pangenome graph. The workflow runs within a Docker container, ensuring a consistent environment. Alternatively, Singularity can be used if Docker is not preferred.


To run the workflow, use the following command:

```bash

nextflow run germline-minicactus.nf -c nextflow.config

```

Key Parameters

    cram_list: Path to the file containing a list of CRAM files.
    ref: Reference genome file path.
    outdir: Output directory for results.

Ensure Docker is installed and configured, as the workflow relies on Docker containers for reproducible environments.
