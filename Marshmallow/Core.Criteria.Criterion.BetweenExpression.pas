unit Core.Criteria.Criterion.BetweenExpression;

interface

{$I sv.inc}

uses
  Core.Interfaces
  ,Core.Criteria.AbstractCriterion
  ,Rtti
  ,SQL.Types
  ,SQL.Params
  ,SQL.Commands
  ,SQL.Interfaces
  ,Spring.Collections
  ;

type
  TBetweenExpression = class(TAbstractCriterion)
  private
    FPropertyName: string;
    FLowValue: TValue;
    FOperator: TWhereOperator;
    FHighValue: TValue;
  public
    constructor Create(const APropertyName: string; const ALowValue, AHighValue: TValue; const AOperator: TWhereOperator); virtual;
  public
    function ToSqlString(AParams: IList<TDBParam>; ACommand: TDMLCommand; AGenerator: ISQLGenerator; AAddToCommand: Boolean): string; override;
    function GetWhereOperator(): TWhereOperator; override;

    property PropertyName: string read FPropertyName;
    property LowValue: TValue read FLowValue;
    property HighValue: TValue read FHighValue write FHighValue;
  end;

implementation

uses
  SysUtils
  ;


{ TBetweenExpression }

constructor TBetweenExpression.Create(const APropertyName: string; const ALowValue,
  AHighValue: TValue; const AOperator: TWhereOperator);
begin
  inherited Create();
  FPropertyName := APropertyName;
  FLowValue := ALowValue;
  FHighValue := AHighValue;
  FOperator := AOperator;
end;

function TBetweenExpression.GetWhereOperator: TWhereOperator;
begin
  Result := FOperator;
end;

function TBetweenExpression.ToSqlString(AParams: IList<TDBParam>;
  ACommand: TDMLCommand; AGenerator: ISQLGenerator; AAddToCommand: Boolean): string;
var
  LParam: TDBParam;
  LWhere: TSQLWhereField;
  LParamName, LParamName2: string;
begin
  Assert(ACommand is TWhereCommand);
  inherited;
  LParamName := ACommand.GetAndIncParameterName(FPropertyName);
  LParamName2 := ACommand.GetAndIncParameterName(FPropertyName);
  LWhere := TSQLWhereField.Create(FPropertyName, GetCriterionTable(ACommand) );
  LWhere.MatchMode := GetMatchMode;
  LWhere.WhereOperator := GetWhereOperator;
  LWhere.ParamName := LParamName;
  LWhere.ParamName2 := LParamName2;

  Result := LWhere.ToSQLString(AGenerator.GetEscapeFieldnameChar); {TODO -oLinas -cGeneral : fix escape fields}

  if AAddToCommand then
    TWhereCommand(ACommand).WhereFields.Add(LWhere)
  else
    LWhere.Free;

  //1st parameter Low
  LParam := TDBParam.Create();
  LParam.SetFromTValue(FLowValue);
  LParam.Name := LParamName;
  AParams.Add(LParam);
  //2nd parameter High
  LParam := TDBParam.Create();
  LParam.SetFromTValue(FHighValue);
  LParam.Name := LParamName2;
  AParams.Add(LParam);
end;

end.
