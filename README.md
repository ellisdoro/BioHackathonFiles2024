# Workflows
This repository contains following workflows:
- [AddTogoVarAnnotation CWL tool](#addtogovarannotation-cwl-tool)**`(AddTogoVarAnnotation.cwl)`:** This workflow adds the TGVID (TogoVar ID) to the INFO column of your VCF file.

# AddTogoVarAnnotation CWL tool
## Usage
```console
cwltool \
  "BioHackathonFiles2024/Tools/AddTogoVarAnnotation.cwl" \
  --annotationfile annotation.tsv.gz \
  --header annotation.hdr \
  --vcf target-vcf.vcf.gz
```

## Data required to run workflows
- annotation.tsv.gz
  - https://grch38.togovar.org/downloads/release/current/grch38/annotation/
  - Please also download the INDEX file（.tbi）.
  - The genomic coordinate is GRCH38.
- annotation.hdr
  - https://grch38.togovar.org/downloads/release/current/grch38/annotation/scripts/annots.hdr
  - The tgvid in the hdr file is the variant ID assigned by TogoVar.
- target-vcf.vcf.gz
  - vcf file