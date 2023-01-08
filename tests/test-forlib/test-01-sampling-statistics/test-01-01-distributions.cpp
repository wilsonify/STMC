#include <gtest/gtest.h>
#include "gmock/gmock-matchers.h"
#include "forlib.h"


TEST(test_RMAFUN, test_RMAFUN01)
{
    double result;
    result = rmafun();
    EXPECT_LE(result, 1.0);
    EXPECT_GE(result, 0.0);
}