#include <gtest/gtest.h>
#include "gmock/gmock-matchers.h"
#include "rmafun.h"

TEST(test_RMAFUN, test_RMAFUN01)
{
    double result;
    result = RMAFUN();
    EXPECT_LE(1.0, result);
    EXPECT_GE(0.0, result);
}