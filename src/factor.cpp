#include "factor.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cassert>
#include <string>
#include <sstream>
#include <vector>
#include <map>

typedef std::vector<int> intvec;

static bool isPrime(int n) {
    if (n <= 1)
        return false;
    for (int d = n / 2; d > 1; --d)
        if (n % d == 0)
            return false;
    return true;
}

/* This implementation works, but it is way too slow with big numbers. Not only because of the recursion,
 * but because this is quite much the brute force algorithm. */
bool factorize(std::vector <intvec> *out, int input, const intvec &otherFactors, int level, int iter = 0) {
        if (level == 0)
                return false;

        if (input < 0) input *= -1;
        for (int d = input / 2; d > 1; --d) {
                if (input % d == 0) {
                        intvec tmp1 = otherFactors, tmp2 = otherFactors;

                        tmp1.push_back(d);
                        tmp1.push_back(input / d);

                        tmp2.push_back(input / d);

                        out->push_back(tmp1);
                        factorize(out, d, tmp2, level - 1, iter + 1);
                        return true;
                }
        }
        return false;
}

void runUnitTests() {
    assert(isPrime(1) == false);
    assert(isPrime(3) == true);
    assert(isPrime(4) == false);
    assert(isPrime(1237) == true);
    assert(isPrime(1237435) == false);

    std::vector <intvec> out1, out2;
    intvec otherFacts1, otherFacts2;

    assert(factorize(&out1, 1234, otherFacts1, 3) == true);
    assert(out1.size() == 1);
    for (size_t i = 0; i < out1[0].size(); ++i)
        qDebug() << i << ":" << out1[0][i];
    std::sort(out1[0].begin(), out1[0].end());
    assert(out1[0][0] == 2);
    assert(out1[0][1] == 617);

    assert(factorize(&out2, 397, otherFacts2, 3) == false);
}

static std::string superScriptDigit(int i) {
    std::string tab[] = {
        "\u2070",
        "\u00B9",
        "\u00B2",
        "\u00B3",
        "\u2074",
        "\u2075",
        "\u2076",
        "\u2077",
        "\u2078",
        "\u2079"
    };

    if (i >= 0 && i <= 9)
        return tab[i];
    else
        return "?";
}

static std::string superScript(int i) {
    std::string ret;
    do {
        int digit = i % 10;
        i /= 10;
        ret.insert(0, superScriptDigit(digit));
    } while (i > 0);
    return ret;
}

static std::string decoratePrime(int x) {
    std::ostringstream out;
    if (isPrime(x))
        out << "<b>" << x << "</b>";
    else
        out << x;
    return out.str();
}

static std::string stringify(const intvec &m) {
    std::ostringstream out;
    int prevFactor = 0;
    for (intvec::const_iterator x = m.begin(); x != m.end(); ++x) {
        out << decoratePrime(*x);
        prevFactor = *x;
        int exponent = 1;
        for (intvec::const_iterator y = x + 1; y != m.end() && (*y) == prevFactor; ++y, ++x)
            ++exponent;
        if (exponent > 1)
            out << superScript(exponent);
        if (x + 1 != m.end())
            out << "\u00A0*\u00A0";
    }
    return out.str();
}

std::string factHelper(int input, int iterations, bool outputForCover) {
        std::vector <intvec> out;
        std::ostringstream s;
        std::string equals;
        s << input;
        if (outputForCover)
            s << "<br />";

        if (iterations == 0)
            goto end;

        if (input >= 0)
            equals = " =\u00A0";
        else
            equals = " =\u00A0-";

        if (!factorize(&out, input, intvec(), iterations)) {
            s << " = " << decoratePrime(input);
        } else {
            for (int i = static_cast<int>(outputForCover ? out.size() - 1 : 0);
                 i < iterations && i < static_cast<int>(out.size());
                 ++i) {
                std::sort(out[i].begin(), out[i].end());
                s << equals << stringify(out[i]);
            }
        }
end:
        return s.str();
}

Factorizer::Factorizer() {}

QString Factorizer::factorize(int in, int iterations, bool outputForCover) const {
    qDebug() << "factorize called" << in << iterations;

    QString result = factHelper(in, iterations, outputForCover).c_str();
    result.replace("*", "×");
    return result;
}
