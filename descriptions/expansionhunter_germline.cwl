#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

hints:
  - class: DockerRequirement
    dockerPull: ACCOUNT/expansionhunter_germline:VERSION

baseCommand: [/ExpansionHunter-v5.0.0-linux_x86_64/bin/ExpansionHunter]

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
    doc: variant catalog with STR to use as json file

  - id: output_prefix
    type: string
    default: 'output'
    inputBinding:
      prefix: --output-prefix

  - id: nthreads
    type: int
    default: 16
    inputBinding:
      prefix: --threads
    doc: number of threads to use


outputs:
  - id: repeats_vcf
    type: File
    outputBinding:
      glob: $(inputs.output_prefix + ".vcf")

  - id: repeats_json
    type: File
    outputBinding:
      glob: $(inputs.output_prefix + ".json")

doc: |
  run ExpansionHunter for germline data
