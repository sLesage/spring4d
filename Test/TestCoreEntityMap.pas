unit TestCoreEntityMap;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Generics.Collections, Rtti, Core.EntityMap, uModels;

type
  // Test methods for class TEntityMap
  {$HINTS OFF}
  TestTEntityMap = class(TTestCase)
  private
    FEntityMap: TEntityMap;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestIsMapped;
    procedure TestIsIDMapped;
    procedure TestAdd;
    procedure TestAddOrReplace;
    procedure TestGet;
    procedure TestRemove;
    procedure TestReplace;
    procedure TestClear;
    procedure TestGetList;
    procedure TestHasIdValue;
  end;

implementation

uses
  SysUtils
  ;

function CreateCustomer(): TCustomer;
begin
  Result := TCustomer.Create;
  Result.Name := 'Test Case';
  Result.Age := 15;
  Result.Height := 1.11;
  Result.LastEdited := EncodeDate(2011,1,1);
  Result.EMail := 'test@gmail.com';
end;

function CreateCompany(): TCompany;
begin
  Result := TCompany.Create;
  Result.Name := 'Test Company';
end;

procedure TestTEntityMap.SetUp;
begin
  FEntityMap := TEntityMap.Create(True);
end;

procedure TestTEntityMap.TearDown;
begin
  FEntityMap.Free;
  FEntityMap := nil;
end;

procedure TestTEntityMap.TestIsMapped;
var
  ReturnValue: Boolean;
  AObject, LClone: TCustomer;
  LCompany, LClonedCompany: TCompany;
begin
  AObject := CreateCustomer;
  LCompany := CreateCompany;
  try
    ReturnValue := FEntityMap.IsMapped(AObject);
    CheckFalse(ReturnValue);
    LClone := CreateCustomer;
    FEntityMap.Add(LClone);

    ReturnValue := FEntityMap.IsMapped(AObject);
    CheckTrue(ReturnValue);

    ReturnValue := FEntityMap.IsMapped(LCompany);
    CheckFalse(ReturnValue);

    LClonedCompany := CreateCompany;
    FEntityMap.AddOrReplace(LClonedCompany);

    ReturnValue := FEntityMap.IsMapped(LCompany);
    CheckTrue(ReturnValue);

  finally
    AObject.Free;
    LCompany.Free;
  end;
end;

procedure TestTEntityMap.TestIsIDMapped;
var
  ReturnValue: Boolean;
begin
  CheckTrue(False, 'Test Not implemented');
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestAdd;
var
  AObject: TObject;
begin
  CheckTrue(False, 'Test Not implemented');
  // TODO: Setup method call parameters
 // FEntityMap.Add(AObject);
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestAddOrReplace;
var
  AObject: TObject;
begin
  // TODO: Setup method call parameters
  CheckTrue(False, 'Test Not implemented');
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestGet;
var
  ReturnValue: TObject;
  AObject: TObject;
begin
  // TODO: Setup method call parameters
  CheckTrue(False, 'Test Not implemented');
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestRemove;
var
  AObject: TObject;
begin
  // TODO: Setup method call parameters
  CheckTrue(False, 'Test Not implemented');
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestReplace;
var
  AObject: TObject;
begin
  // TODO: Setup method call parameters
  CheckTrue(False, 'Test Not implemented');
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestClear;
var
  AAll: Boolean;
begin
  // TODO: Setup method call parameters
  CheckTrue(False, 'Test Not implemented');
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestGetList;
begin
  //ReturnValue := FEntityMap.GetList;
  // TODO: Validate method results
end;

procedure TestTEntityMap.TestHasIdValue;
var
  ReturnValue: Boolean;
  AObject: TObject;
begin
  // TODO: Setup method call parameters
  CheckTrue(False, 'Test Not implemented');
  // TODO: Validate method results
end;

{$HINTS ON}

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTEntityMap.Suite);
end.

