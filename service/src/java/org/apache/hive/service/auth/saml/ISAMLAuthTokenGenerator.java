/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.hive.service.auth.saml;

/**
 * Interface which is used by SAML authentication for the token generation and validation
 * logic. The token generated by the {@code get()} method must have enough encoded
 * information to be able to validated it at a later point of time.
 */
public interface ISAMLAuthTokenGenerator {

  /**
   * Get the token for a given user and relay state id.
   */
  String get(String username, String relayStateId);

  /**
   * Validate the given token. Throws {@link HttpSamlAuthenticationException} in case
   * of any validation errors.
   */
  String validate(String token) throws HttpSamlAuthenticationException;
}
