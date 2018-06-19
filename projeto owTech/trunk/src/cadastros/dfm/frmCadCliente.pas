unit frmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pgClientes: TPageControl;
    tsDados: TTabSheet;
    GroupBox1: TGroupBox;
    lCodigo: TLabel;
    eCodigo: TEdit;
    Label12: TLabel;
    edtDtInclusao: TEdit;
    Label20: TLabel;
    cbAtivo: TComboBox;
    Label2: TLabel;
    edtNomeEmpresa: TEdit;
    Label1: TLabel;
    lblNomeFantasia: TLabel;
    edtNomeFantasia: TEdit;
    tsContato: TTabSheet;
    lblCnpj: TLabel;
    edtCnpj: TEdit;
    edtIE: TEdit;
    lblIE: TLabel;
    gbEndereco: TGroupBox;
    DBGrid2: TDBGrid;
    dbGEndereco: TDBGrid;
    Panel1: TPanel;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    DBNavigator: TDBNavigator;
    edt_pesquisa: TEdit;
    gbTelefone: TGroupBox;
    gbEmail: TGroupBox;
    dbTelefone: TDBGrid;
    DBGrid3: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
