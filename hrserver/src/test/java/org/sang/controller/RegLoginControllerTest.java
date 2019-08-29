package org.sang.controller;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.rules.Timeout;
import org.sang.bean.RespBean;
import org.sang.controller.RegLoginController;

public class RegLoginControllerTest {

  @Rule public final ExpectedException thrown = ExpectedException.none();

  @Rule public final Timeout globalTimeout = new Timeout(10000);

  // Test written by Diffblue Cover.
  @Test
  public void basicHelloOutputNotNull() {

    // Arrange
    final RegLoginController regLoginController = new RegLoginController();

    // Act and Assert result
    Assert.assertEquals("basicHello", regLoginController.basicHello());
  }

  // Test written by Diffblue Cover.
  @Test
  public void helloOutputNotNull() {

    // Arrange
    final RegLoginController regLoginController = new RegLoginController();

    // Act and Assert result
    Assert.assertEquals("hello", regLoginController.hello());
  }

  // Test written by Diffblue Cover.
  @Test
  public void loginOutputNotNull() {

    // Arrange
    final RegLoginController regLoginController = new RegLoginController();

    // Act
    final RespBean actual = regLoginController.login();

    // Assert result
    Assert.assertNotNull(actual);
    Assert.assertEquals(new Integer(500), actual.getStatus());
    Assert.assertNull(actual.getObj());
    Assert.assertEquals("\u5c1a\u672a\u767b\u5f55\uff0c\u8bf7\u767b\u5f55!", actual.getMsg());
  }
}
