function Sdot = odefun(t, S)

Sdot(1) = S(2);
Sdot(2) = -1 + S(2)^2;
Sdot = Sdot';