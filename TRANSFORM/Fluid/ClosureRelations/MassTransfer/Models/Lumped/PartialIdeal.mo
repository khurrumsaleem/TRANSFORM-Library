within TRANSFORM.Fluid.ClosureRelations.MassTransfer.Models.Lumped;
partial model PartialIdeal

extends PartialMassTransfer(
     final flagIdeal=1);

  TRANSFORM.Media.BaseProperties1Phase medium(redeclare package
      Medium =
        Medium, state=state) "Bulk fluid properties"
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialIdeal;
