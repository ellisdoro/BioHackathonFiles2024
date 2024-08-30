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

    
# Workflow for Mini Cactus

This repository contains a Nextflow configuration file (nextflow.config) and a workflow script (germline-minicactus.nf) to process genomic data using Samtools, Cactus, and VG.

## Usage

To run the workflow, use the following command:

```bash

nextflow run germline-minicactus.nf -c nextflow.config

```

Key Parameters

    cram_list: Path to the file containing a list of CRAM files.
    ref: Reference genome file path.
    outdir: Output directory for results.

Ensure Docker is installed and configured, as the workflow relies on Docker containers for reproducible environments.
