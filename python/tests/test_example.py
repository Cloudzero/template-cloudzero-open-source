#  SPDX-FileCopyrightText: Copyright (c) CloudZero, Inc. or its affiliates. All Rights Reserved.
#  SPDX-License-Identifier: Apache-2.0

"""Example test file for demonstrating pytest setup."""


def test_example():
    """Example test that always passes."""
    assert True


def test_version_exists():
    """Test that package version is defined."""
    from src import __version__

    assert __version__ is not None
    assert isinstance(__version__, str)
