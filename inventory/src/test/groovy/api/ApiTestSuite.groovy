package api

import org.folio.metadata.common.VertxAssistant
import org.junit.AfterClass
import org.junit.BeforeClass
import org.junit.runner.RunWith
import org.junit.runners.Suite

import java.util.concurrent.CompletableFuture

@RunWith(Suite.class)

@Suite.SuiteClasses([
  ModsIngestExamples.class
])

public class ApiTestSuite {

  private static VertxAssistant vertxAssistant = new VertxAssistant();
  public static final INVENTORY_VERTICLE_TEST_PORT = 9603

  @BeforeClass
  public static void before() {
    startVertx()
    startInventoryVerticle()
  }

  @AfterClass
  public static void after() {
    stopVertx()
  }

  private static stopVertx() {
    vertxAssistant.stop()
  }

  private static startVertx() {
    vertxAssistant.start()
  }

  private static startInventoryVerticle() {
    def deployed = new CompletableFuture()

    def config = ["port": INVENTORY_VERTICLE_TEST_PORT,
                  "storage.type" : "memory"]

    vertxAssistant.deployGroovyVerticle(
      "org.folio.inventory.InventoryVerticle", config,  deployed)

    deployed.join()
  }
}