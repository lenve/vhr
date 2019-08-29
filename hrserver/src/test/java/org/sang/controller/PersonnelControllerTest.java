package org.sang.controller;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.rules.Timeout;
import org.sang.controller.PersonnelController;

public class PersonnelControllerTest {

  @Rule public final ExpectedException thrown = ExpectedException.none();

  @Rule public final Timeout globalTimeout = new Timeout(10000);

  // Test written by Diffblue Cover.
  @Test
  public void helloEmpOutputNotNull() {

    // Arrange
    final PersonnelController personnelController = new PersonnelController();

    // Act and Assert result
    Assert.assertEquals("hello emp", personnelController.helloEmp());
  }

  // Test written by Diffblue Cover.
  @Test
  public void helloOutputNotNull() {

    // Arrange
    final PersonnelController personnelController = new PersonnelController();

    // Act and Assert result
    Assert.assertEquals("hello", personnelController.hello());
  }
}
