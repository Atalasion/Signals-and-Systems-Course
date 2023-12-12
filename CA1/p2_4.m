function [alp, bet] = p2_4(x, y)
    c1 = dot(x, y);
    c2 = dot(x, x);
    c3 = sum(x);
    c4 = sum(y);
    c5 = length(x);
    syms a b
    eq1 = a * c2 + b * c3 == c1;
    eq2 = -a * c3 - b * c5 == -c4;
    sol = solve([eq1, eq2], [a, b]);
    alp = sol.a;
    bet = sol.b;
    fprintf("alpha = %.10f, beta = %.10f", sol.a, sol.b);
end