#!/usr/bin/env cwl-runner

class: CommandLineTool
id: vcf-togovar-annotation
label: vcf-togovar-annotation
cwlVersion: v1.2

requirements:
  DockerRequirement:
    dockerPull: biocontainers/bcftools:v1.9-1-deb_cv1

baseCommand: [bcftools]

arguments:
  - position: 1
    valueFrom: annotate
  - $(inputs.vcf.basename).togovar.vcf.gz

inputs:
  colname:
    type: string?
    default: TGV,-,CHROM,POS,-,-,-,-,-,-,-,-,-,-
    inputBinding:
      position: 2
      prefix: -c
  annotationfile:
    type: File
    inputBinding:
      position: 3
      prefix: --annotations
  header:
    type: File
    inputBinding:
      position: 4
      prefix: -h
  vcf:
    type: File
    inputBinding:
      position: 5

outputs:
  outputfile:
    type: File
    outputBinding:
      glob: $(inputs.vcf.basename).togovar.vcf.gz