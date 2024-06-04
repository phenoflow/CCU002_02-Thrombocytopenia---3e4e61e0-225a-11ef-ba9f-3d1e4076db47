cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu002_02-thrombocytopenia-thrombocytopaenia---primary:
    run: ccu002_02-thrombocytopenia-thrombocytopaenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  ccu002_02-thrombocytopenia-induced---primary:
    run: ccu002_02-thrombocytopenia-induced---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_02-thrombocytopenia-thrombocytopaenia---primary/output
  hereditary-ccu002_02-thrombocytopenia---primary:
    run: hereditary-ccu002_02-thrombocytopenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_02-thrombocytopenia-induced---primary/output
  ccu002_02-thrombocytopenia-acquired---primary:
    run: ccu002_02-thrombocytopenia-acquired---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: hereditary-ccu002_02-thrombocytopenia---primary/output
  defective-ccu002_02-thrombocytopenia---primary:
    run: defective-ccu002_02-thrombocytopenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-thrombocytopenia-acquired---primary/output
  primary-ccu002_02-thrombocytopenia---primary:
    run: primary-ccu002_02-thrombocytopenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: defective-ccu002_02-thrombocytopenia---primary/output
  ccu002_02-thrombocytopenia---primary:
    run: ccu002_02-thrombocytopenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: primary-ccu002_02-thrombocytopenia---primary/output
  secondary-ccu002_02-thrombocytopenia---primary:
    run: secondary-ccu002_02-thrombocytopenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu002_02-thrombocytopenia---primary/output
  thrombotic-ccu002_02-thrombocytopenia---primary:
    run: thrombotic-ccu002_02-thrombocytopenia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: secondary-ccu002_02-thrombocytopenia---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: thrombotic-ccu002_02-thrombocytopenia---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
