#include "factor.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <sstream>
#include <vector>

bool fact(std::vector <std::string> *out, int input, const char *otherFacts, int level, int iter = 0) {
        if (level == 0)
                return false;

        if (input < 0) input *=-1;
        for (int d = input - 1; d > 1; --d) {
                if (input % d == 0) {
                        char tmp1[256], tmp2[256];
                        sprintf(tmp1, "%d * %d%s%s", d, input / d, strlen(otherFacts) > 0 ? " * " : "", otherFacts);
                        sprintf(tmp2, "%s%s%d", otherFacts, strlen(otherFacts) > 0 ? " * " : "", input / d);
                        out->push_back(tmp1);
                        fact(out, d, tmp2, level - 1, iter + 1);
                        return true;
                }
        }
        return false;
}

std::string factHelper(int input, int iterations) {
        std::vector <std::string> out;
        std::ostringstream s;
        std::string equals;
        s << input << "\n";

        if (input >= 0)
            equals = " = ";
        else
            equals = " = -";

        if (!fact(&out, input, "", 20)) {
            s << " = " << input;
        } else {
            for (int i = 0; i < iterations && i < static_cast<int>(out.size()); ++i)
                s << equals << out[i] << "\n";
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
