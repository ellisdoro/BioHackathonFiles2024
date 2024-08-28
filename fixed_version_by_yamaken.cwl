#!/usr/bin/env cwl-runner

class: CommandLineTool
id: vcf-togovar-annotation
label: vcf-togovar-annotation
cwlVersion: v1.2

requirements:
  DockerRequirement:
    dockerPull: biocontainers/bcftools

baseCommand: [bcftools]

arguments:
  - position: 1
    valueFrom: annotate

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
      glob: $(inputs.vcf.nameroot)_togovar.vcf