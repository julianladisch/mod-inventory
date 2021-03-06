package org.folio.inventory.support;

import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.lang.invoke.MethodHandles;
import java.net.URLEncoder;
import java.util.List;
import java.util.stream.Collectors;

public class CqlHelper {
  private CqlHelper() { }

  private static final Logger log = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

  public static String multipleRecordsCqlQuery(List<String> recordIds) {
    if(recordIds.isEmpty()) {
      return null;
    }
    else {
      String query = String.format("id=(%s)", recordIds.stream()
        .map(String::toString)
        .distinct()
        .collect(Collectors.joining(" or ")));

      try {
        return URLEncoder.encode(query, "UTF-8");

      } catch (UnsupportedEncodingException e) {
        log.error(String.format("Cannot encode query %s", query));
        return null;
      }
    }
  }
}
