inherited frmcadastrocaixa: Tfrmcadastrocaixa
  Caption = 'Lan'#231'amentos no Caixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbscadastro: TTabSheet
      object Label2: TLabel
        Left = 3
        Top = 24
        Width = 62
        Height = 13
        Caption = 'N'#250'mero Doc:'
      end
      object Label3: TLabel
        Left = 3
        Top = 64
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label5: TLabel
        Left = 3
        Top = 104
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object edtnumerodoc: TEdit
        Left = 67
        Top = 21
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtdescricao: TEdit
        Left = 67
        Top = 61
        Width = 337
        Height = 21
        TabOrder = 1
      end
      object edtvalor: TtpEdit
        Left = 67
        Top = 101
        Width = 121
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        TabOrder = 2
        Text = '0,00'
        Caracter = tcReal
      end
      object RadioGroup: TRadioGroup
        Left = 3
        Top = 152
        Width = 185
        Height = 49
        Caption = 'Tipo:'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        TabOrder = 3
      end
    end
    inherited tbspesquisa: TTabSheet
      inherited btnfiltrar: TButton
        OnClick = btnfiltrarClick
      end
      inherited DbgDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'documento'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end>
      end
      inherited cbxfiltros: TComboBoxEx
        ItemsEx = <
          item
            Caption = 'Documento'
          end
          item
            Caption = 'Descricao'
          end>
      end
    end
  end
  inherited ImageListcadastro: TImageList
    Left = 632
    Top = 128
  end
  inherited actacoes: TActionList
    Left = 632
    Top = 224
  end
end
