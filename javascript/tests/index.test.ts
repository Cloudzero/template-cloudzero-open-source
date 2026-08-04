//  SPDX-FileCopyrightText: Copyright (c) CloudZero, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import { greet, VERSION } from "../src/index";

describe("Template Tests", () => {
  it("should pass example test", () => {
    expect(true).toBe(true);
  });

  it("should have version defined", () => {
    expect(VERSION).toBeDefined();
    expect(typeof VERSION).toBe("string");
  });

  it("should greet correctly", () => {
    expect(greet("World")).toBe("Hello, World!");
  });
});
