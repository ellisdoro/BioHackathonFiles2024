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