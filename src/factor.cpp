#include "factor.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <sstream>
#include <vector>
#include <map>

typedef std::vector<int> intvec;

bool fact(std::vector <intvec> *out, int input, const intvec &otherFacts, int level, int iter = 0) {
        if (level == 0)
                return false;

        if (input < 0) input *=-1;
        for (int d = input - 1; d > 1; --d) {
                if (input % d == 0) {
                        intvec tmp1 = otherFacts, tmp2 = otherFacts;

                        tmp1.push_back(d);
                        tmp1.push_back(input / d);

                        tmp2.push_back(input / d);

                        out->push_back(tmp1);
                        fact(out, d, tmp2, level - 1, iter + 1);
                        return true;
                }
        }
        return false;
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

static std::string stringify(const intvec &m) {
    std::ostringstream out;
    int prevFactor = 0;
    for (intvec::const_iterator x = m.begin(); x != m.end(); ++x) {
        out << (*x);
        prevFactor = *x;
        int exponent = 1;
        for (intvec::const_iterator y = x + 1; y != m.end() && (*y) == prevFactor; ++y, ++x)
            ++exponent;
        if (exponent > 1)
            out << superScript(exponent);
        if (x + 1 != m.end())
            out << " * ";
    }
    return out.str();
}

std::string factHelper(int input, int iterations) {
        std::vector <intvec> out;
        std::ostringstream s;
        std::string equals;
        s << input;

        if (input >= 0)
            equals = " = ";
        else
            equals = " = -";

        if (!fact(&out, input, intvec(), iterations)) {
            s << " = " << input;
        } else {
            for (int i = 0; i < iterations && i < static_cast<int>(out.size()); ++i) {
                std::sort(out[i].begin(), out[i].end());
                s << equals << stringify(out[i]);
            }
        }
        return s.str();
}

Factorizer::Factorizer() {}

QString Factorizer::factorize(int in, int iterations) const {
    qDebug() << "factorize called" << in << iterations;

    QString result = factHelper(in, iterations).c_str();
    result.replace("*", "×");
    return result;
}
