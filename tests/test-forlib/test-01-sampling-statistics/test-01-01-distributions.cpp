#include <gtest/gtest.h>
#include "gmock/gmock-matchers.h"
#include "rmafun.h"
extern "C" double get_double();
extern "C" double rmafun();

TEST(test_RMAFUN, test_RMAFUN01)
{
    double result;
    result = rmafun();//RMAFUN();
    EXPECT_LE(result, 1.0);
    EXPECT_GE(result, 0.0);
}