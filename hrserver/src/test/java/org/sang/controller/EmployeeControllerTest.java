package org.sang.controller;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.rules.Timeout;
import org.sang.controller.EmployeeController;

public class EmployeeControllerTest {

  @Rule public final ExpectedException thrown = ExpectedException.none();

  @Rule public final Timeout globalTimeout = new Timeout(10000);

  // Test written by Diffblue Cover.
  @Test
  public void basicOutputNotNull() {

    // Arrange
    final EmployeeController employeeController = new EmployeeController();

    // Act and Assert result
    Assert.assertEquals("basic", employeeController.basic());
  }

  // Test written by Diffblue Cover.
  @Test
  public void helloOutputNotNull() {

    // Arrange
    final EmployeeController employeeController = new EmployeeController();

    // Act and Assert result
    Assert.assertEquals("Hello", employeeController.hello());
  }
}
