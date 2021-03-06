within TRANSFORM.Math.Examples;
model meanFactor

  extends TRANSFORM.Icons.Example;

  constant Real[3] variable_1 = {0.3,0.3,0.4};
  constant Real[5] fixed_1 = {0.2,0.2,0.2,0.2,0.2};
  constant Real[3,5] fA_1ans = [2/3,1/3,0,0,0;
                               0,1/3,2/3,0,0;
                               0,0,0,0.5,0.5];

  constant Real[5] variable_2 = {0.15,0.25,0.15,0.25,0.2};
  constant Real[5] fixed_2 = {0.2,0.2,0.2,0.2,0.2};
  constant Real[5,5] fA_2ans = [1,0,0,0,0;
                               0.2,0.8,0,0,0;
                               0,0,1,0,0;
                               0,0,0.2,0.8,0;
                               0,0,0,0,1];

  constant Real[8] variable_3 = {0.1,0.05,0.2,0.2,0.2,0.2,0.2,0.05};
  constant Real[3] fixed_3 = {0.3,0.3,0.4};
  constant Real[8,3] fA_3ans = [1,0,0;
                               1,0,0;
                               0.75,0.25,0;
                               0,1,0;
                               0,0.2,0.8;
                               0,0,1;
                               0,0,1;
                               0,0,1];

  constant Real[1] variable_4 = {1.0};
  constant Real[3] fixed_4 = {0.3,0.3,0.4};
  constant Real[1,3] fA_4ans = [0.3,0.3,0.4];

  constant Real[3] variable_5 = {0.3,0.3,0.4};
  constant Real[1] fixed_5 = {1.0};
  constant Real[3,1] fA_5ans = [1;
                                1;
                                1];

  constant Real[4] variable_6 = {0,0.3,0.3,0.4};
  constant Real[5] fixed_6 = {0.2,0.2,0.2,0.2,0.2};
  constant Real[4,5] fA_6ans = [0,0,0,0,0;
                                2/3,1/3,0,0,0;
                                0,1/3,2/3,0,0;
                                0,0,0,0.5,0.5];

  final parameter Real[3,5] fA_1 = TRANSFORM.Math.meanFactor(variable_1, fixed_1) "Factor matrix";
  final parameter Real[5,5] fA_2 = TRANSFORM.Math.meanFactor(variable_2, fixed_2) "Factor matrix";
  final parameter Real[8,3] fA_3 = TRANSFORM.Math.meanFactor(variable_3, fixed_3) "Factor matrix";
  final parameter Real[1,3] fA_4 = TRANSFORM.Math.meanFactor(variable_4, fixed_4) "Factor matrix";
  final parameter Real[3,1] fA_5 = TRANSFORM.Math.meanFactor(variable_5, fixed_5) "Factor matrix";
  final parameter Real[4,5] fA_6 = TRANSFORM.Math.meanFactor(variable_6, fixed_6) "Factor matrix";

  final parameter Boolean dfA_1 = Modelica.Math.Matrices.isEqual(fA_1, fA_1ans,10*Modelica.Constants.eps) "=true then f = f_ans";
  final parameter Boolean dfA_2 = Modelica.Math.Matrices.isEqual(fA_2, fA_2ans,10*Modelica.Constants.eps) "=true then f = f_ans";
  final parameter Boolean dfA_3 = Modelica.Math.Matrices.isEqual(fA_3, fA_3ans,10*Modelica.Constants.eps) "=true then f = f_ans";
  final parameter Boolean dfA_4 = Modelica.Math.Matrices.isEqual(fA_4, fA_4ans,10*Modelica.Constants.eps) "=true then f = f_ans";
  final parameter Boolean dfA_5 = Modelica.Math.Matrices.isEqual(fA_5, fA_5ans,10*Modelica.Constants.eps) "=true then f = f_ans";
  final parameter Boolean dfA_6 = Modelica.Math.Matrices.isEqual(fA_6, fA_6ans,10*Modelica.Constants.eps) "=true then f = f_ans";

  Utilities.ErrorAnalysis.UnitTests unitTests(n=3, x=fA_1[:, 1])
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  annotation (experiment(StopTime=10),__Dymola_experimentSetupOutput);
end meanFactor;
