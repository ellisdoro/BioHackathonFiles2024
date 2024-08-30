# TogoVar Annotation CWL Script

This repository contains a Common Workflow Language (CWL) script for annotating Variant Call Format (VCF) files using the TogoVar database. The script leverages bcftools to add TogoVar information to VCF files, enabling the integration of genetic variations into your genomic analysis.
Usage

To run this CWL script, ensure you have cwl-runner installed and Docker enabled, as it uses the biocontainers/bcftools Docker image.
Inputs

    colname: (Optional) Specifies column names for the annotation file.
    annotationfile: A VCF file containing annotations to be added.
    header: Header file for the VCF format.
    vcf: The VCF file to be annotated.
    output_name: The desired name for the output file.

Outputs

    outputfile: The annotated VCF file, with TogoVar information integrated.
    
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
