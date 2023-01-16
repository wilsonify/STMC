
#include <gtest/gtest.h>
#include "gmock/gmock-matchers.h"
#include <vector>
#include "forlib.h"

double round(double value, int decimal_places)
{
    const double multiplier = std::pow(10.0, decimal_places);
    return std::round(value * multiplier) / multiplier;
}
std::vector<double> round_vector(std::vector<double> values, int decimal_places)
{
    std::vector<double> result;
    result.resize(values.size());
    for (int i = 0; i < values.size(); i++)
    {
        result[i] = round(values[i], decimal_places);
    }
    return result;
}

std::vector<std::vector<double>> round_matrix(std::vector<std::vector<double>> values, int decimal_places)
{
    std::vector<std::vector<double>> result;
    result.resize(values.size());
    for (int i = 0; i < values.size(); i++)
    {
        result[i] = round_vector(values[i], decimal_places);
    }
    return result;
}

TEST(test_get_double, test_get_double01)
{
    double result;
    result = get_double_();
    EXPECT_LE(result, 1.0);
    EXPECT_GE(result, 0.0);
}

TEST(test_RMAFUN, test_RMAFUN01)
{
    double result;
    result = rmafun_();
    EXPECT_LE(result, 1.0);
    EXPECT_GE(result, 0.0);
}

TEST(test_addln, test_addln01)
{
    double result;
    double aln = 0.5;
    double bln = 0.8;
    result = addln_(&aln, &bln);
    result = round(result, 2);
    EXPECT_EQ(result, 1.35);
}

double STMEAN_check(const std::vector<double> &X)
{
    double XM = 0.0;
    for (auto x : X)
    {
        XM += x;
    }
    return XM / double(X.size());
}

TEST(test_stmean, test_stmean01)
{
    double result;
    double DATA[8] = {1, 1, 1, 0, 2, 3, 4, 5};
    auto ndat = 8;
    result = stmean_(ndat, DATA);
    result = round(result, 3);
    EXPECT_EQ(result, 2.125);
}

TEST(test_addln_cut, test_addln_cut01)
{
    double result;
    double aln = 0.5;
    double bln = 0.8;
    result = addln_cut_(&aln, &bln);
    result = round(result, 2);
    EXPECT_EQ(result, 1.35);
}

TEST(test_gamma_ln, test_gamma_ln01)
{
    double result;
    double x = 0.75;
    result = gamma_ln_(x);
    result = round(result, 2);
    EXPECT_GE(result, 0.0);
}

TEST(test_beta_i, test_beta_i01)
{
    double result;
    double X = 0.8;
    double A = 5.0;
    double B = 8.0;
    result = beta_i_(&X, &A, &B);
    result = round(result, 2);
    EXPECT_EQ(result, 1.0);
}

TEST(test_bbi_df, test_bbi_df02)
{
    double result;
    int N = 50;
    int K = 20;
    double P = 0.8;
    result = bbi_df_(&N, &K, &P);
    result = round(result, 4);
    EXPECT_EQ(result, 0.0000);
}

TEST(test_bbi_qdf, test_bbi_qdf01)
{
    double result;
    int N = 50;
    int K = 20;
    double P = 0.8;
    result = bbi_qdf_(&N, &K, &P);
    result = round(result, 4);
    EXPECT_EQ(result, 0.0000);
}

TEST(test_beta, test_beta01)
{
    double result;
    double A = 50.0;
    double B = 20.0;
    result = beta_(&A, &B);
    result = round(result, 4);
    EXPECT_EQ(result, 0.0000);
}

TEST(test_bino_cln, test_bino_cln01)
{
    double result;
    int N = 50.0;
    int K = 20.0;
    result = bino_cln_(&N, &K);
    result = round(result, 4);
    EXPECT_EQ(result, 31.4954);
}

TEST(test_bino_coef, test_bino_coef01)
{
    double result;
    int N = 5.0;
    int K = 2.0;
    result = bino_coef_(&N, &K);
    result = round(result, 4);
    EXPECT_EQ(result, 10.0338);
}

TEST(test_bino_df, test_bino_df01)
{
    double result;
    int N = 5.0;
    int K = 2.0;
    double P = 0.8;
    result = bino_df_(&N, &K, &P);
    result = round(result, 4);
    EXPECT_EQ(result, 0.0581);
}

TEST(test_bino_pd, test_bino_pd01)
{
    double result;
    int N = 5.0;
    int K = 2.0;
    double P = 0.8;
    result = bino_pd_(&N, &K, &P);
    result = round(result, 4);
    EXPECT_EQ(result, 0.0514);
}

TEST(test_bino_qdf, test_bino_qdf01)
{
    double result;
    int N = 5.0;
    int K = 2.0;
    double P = 0.8;
    result = bino_qdf_(&N, &K, &P);
    result = round(result, 4);
    EXPECT_EQ(result, 0.0581);
}

TEST(test_cau_df, test_cau_df01)
{
    double result;
    double X = 0.8;
    result = cau_df_(&X);
    result = round(result, 4);
    EXPECT_EQ(result, 0.7148);
}
// TEST(test_cau_qdf, test_cau_qdf01)
// {
//     double result;
//     double X = 0.8;
//     result = cau_qdf_(&X);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.7148);
// }
// TEST(test_cau_xq, test_cau_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = cau_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 1.3764);
// }
// TEST(test_chi2_df, test_chi2_df01)
// {
//     double result;
//     double CHI2 = 0.8;
//     result = chi2_df_(&CHI2);
//     result = round(result, 4);
//     EXPECT_EQ(result, 1.0012);
// }

// TEST(test_chi2_pd, test_chi2_pd01)
// {
//     double result;
//     double CHI2 = 0.8;
//     result = chi2_pd_(&CHI2);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0004);
// }
// TEST(test_chi2_qdf, test_chi2_qdf01)
// {
//     double result;
//     double CHI2 = 0.8;
//     result = chi2_qdf_(&CHI2);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_chi2_xq, test_chi2_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = chi2_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_chi2pdf_df, test_chi2pdf_df01)
// {
//     double result;
//     double CHI2 = 0.8;
//     result = chi2pdf_df_(&CHI2);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_chi2pdf_pd, test_chi2pdf_pd01)
// {
//     double result;
//     double CHI2 = 0.8;
//     result = chi2pdf_pd_(&CHI2);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_chi2pdf_qdf, test_chi2pdf_qdf01)
// {
//     double result;
//     double CHI2 = 0.8;
//     result = chi2pdf_qdf_(&CHI2);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_chi2pdf_xq, test_chi2pdf_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = chi2pdf_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_error_f, test_error_f01)
// {
//     double result;
//     double X = 0.8;
//     result = error_f_(&X);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_F_df, test_F_df01)
// {
//     double result;
//     double F = 0.8;
//     result = f_df_(&F);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }

// double F(double x)
// {
//     return pow(x, 2);
// }
// TEST(test_f_interpol, test_f_interpol01)
// {
//     double result;
//     int N = 5.0;
//     double F[5] = {10, 11, 14, 19, 26};
//     double X[5] = {0, 1, 2, 3, 4};
//     double XX = 15.0;
//     result = f_interpol_(&N, F, X, &XX);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_F_pd, test_F_pd01)
// {
//     double result;
//     double F = 0.8;
//     result = f_pd_(&F);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_F_qdf, test_F_qdf01)
// {
//     double result;
//     double F = 0.8;
//     result = f_qdf_(&F);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_F_xq, test_F_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = f_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_fct_ln, test_fct_ln01)
// {
//     double result;
//     int K = 8;
//     result = fct_ln_(&K);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_fi1, test_fi101)
// {
//     double result=0.1;
//     double F = 10.0;
//     double Y = 10.0;
//     double X1 = 10.0;
//     double X2 = 10.0;
//     //result = fi1_(&F, &Y, &X1, &X2);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_gamma_p, test_gamma_p01)
// {
//     double result;
//     double A = 0.8;
//     double X = 0.8;
//     result = gamma_p_(&A, &X);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_gau_df, test_gau_df01)
// {
//     double result;
//     double X = 0.8;
//     result = gau_df_(&X);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_gau_pd, test_gau_pd01)
// {
//     double result;
//     double X = 0.8;
//     result = gau_pd_(&X);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_gau_qdf, test_gau_qdf01)
// {
//     double result;
//     double X = 0.8;
//     result = gau_qdf_(&X);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_gau_xq, test_gau_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = gau_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_isfun, test_isfun01)
// {
//     double result;
//     int ix = 2;
//     double nla[5] = {1, 2, 3, 4, 5};
//     int nd = 5;
//     result = isfun_(&ix, nla, &nd);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_lpt_ex_ia, test_lpt_ex_ia01)
// {
//     bool result;
//     double BETA1 = 0.5;
//     double BETA2 = 0.5;
//     double IACT1 = 0.5;
//     double IACT2 = 0.5;
//     result = lpt_ex_ia_(&BETA1, &BETA2, &IACT1, &IACT2);
//     EXPECT_EQ(result, true);
// }

// TEST(test_nsfun, test_nsfun01)
// {
//     double result;
//     double nla[5] = {1, 2, 3, 4, 5};
//     int nd = 5;
//     result = nsfun_(nla, &nd);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }

// TEST(test_nsum, test_nsum01)
// {
//     double result;
//     int N1 = 2.0;
//     int N2 = 5.0;
//     double NA[5] = {1, 2, 3, 4, 5};
//     result = nsum_(&N1, &N2, NA);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }

// TEST(test_stud_df, test_stud_df01)
// {
//     double result;
//     double T = 0.8;
//     result = stud_df_(&T);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_stud_pd, test_stud_pd01)
// {
//     double result;
//     double T = 0.8;
//     result = stud_pd_(&T);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_stud_qdf, test_stud_qdf01)
// {
//     double result;
//     double T = 0.8;
//     result = stud_qdf_(&T);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
// TEST(test_stud_xq, test_stud_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = stud_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }

// TEST(test_autocorf, test_autocorf01)
// {
//     double result;
//     int IT = 2;
//     double DATA[8] = {1, 1, 1, 0, 2, 3, 4, 5};
//     auto NDAT = 8;
//     bool LMEAN = true;
//     result = autocorf_(&IT, &NDAT, DATA, &LMEAN);
//     result = round(result, 2);
//     EXPECT_EQ(result, 4.95);
// }

// TEST(test_bbi_nk_df, test_bbi_nk_df01)
// {
//     double result;
//     double P = 0.8;
//     result = bbi_nk_df_(&P);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0000);
// }

// TEST(test_bbi_nk_xq_, test_bbi_nk_xq_01)
// {
//     double result = 0.0;
//     // double Q = 0.8;
//     // result = bbi_nk_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0000);
// }

// TEST(test_bbi1_nk_df, test_bbi1_nk_df01)
// {
//     double result;
//     double P = 0.8;
//     result = bbi1_nk_df_(&P);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0000);
// }

// TEST(test_bbi1_nk_xq, test_bbi1_nk_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = bbi1_nk_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0000);
// }

// TEST(test_bino_nk_df, test_bino_nk_df01)
// {
//     double result;
//     double Q = 0.8;
//     result = bino_nk_df_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }

// TEST(test_bino_nk_xq, test_bino_nk_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = bino_nk_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }

// TEST(test_bino1_nk_df, test_bino1_nk_df01)
// {
//     double result;
//     double P = 0.8;
//     result = bino1_nk_df_(&P);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }

// TEST(test_bino1_nk_xq, test_bino1_nk_xq01)
// {
//     double result;
//     double Q = 0.8;
//     result = bino1_nk_xq_(&Q);
//     result = round(result, 4);
//     EXPECT_EQ(result, 0.0581);
// }
