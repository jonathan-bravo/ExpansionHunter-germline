#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

# CHANGE THIS
hints:
  - class: DockerRequirement
    dockerPull: ACCOUNT/snv_germline_eh:VERSION

baseCommand: [/ExpansionHunter-v4.0.2-linux_x86_64/bin/ExpansionHunter]

inputs:
  - id: input_bam
    type: File
    inputBinding:
      prefix: --reads
    secondaryFiles:
      - .bai
    doc: input bam file

  - id: reference
    type: File
    inputBinding:
      prefix: --reference
    secondaryFiles:
      - ^.dict
      - .fai
    doc: expect the path to the fa file

  - id: variant_catalog
    type: File
    inputBinding:
      prefix: --variant-catalog
    doc: 

  - id: output_prefix
    type: string
    default: 'EH'
    inputBinding:
      prefix: --output-prefix
    doc: 

outputs:
  - id: vcf
    type: File
    outputBinding:
      glob: $(inputs.output_prefix + ".vcf")

doc: |
  run ExpansionHunter