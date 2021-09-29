tol = 0.0001;
l = 0;
r = 10;

t = (-1 + sqrt(5))/2;
L = r - l;
x1 = r - t * L;
x2 = l + t * L;
fx1 = f(x1);
fx2 = f(x2);
f_count = 2;
c_count = 0;

while L >= tol
    c_count = c_count + 1;
    fprintf('[INFO] Iteracija:%d Intervalas[%.10f,%.10f], x1 = %.10f, x2 = %.10f %.10f\n',c_count, l, r, x1, x2, fx1);
    if fx2 < fx1
        l = x1;
        L = r - l;
        x1 = x2;
        fx1 = fx2;
        x2 = l + t * L;
        fx2 = f(x2);
        f_count = f_count + 1;
    else
        r = x2;
        L = r - l;
        x2 = x1;
        x1 = r - t * L;
        fx2 = fx1;
        fx1 = f(x1);
        f_count = f_count + 1;
    end
end

minY = min([fx1, fx2]);
if minY == fx1
    minX = x1;
else
    minX = x2;
end

fprintf('[ATS] Minimumo taskas X asyje: %.10f\n', minX);
fprintf('[ATS] Tikslo funkcijos reiksme minimumo taske: %.10f\n', minY);
fprintf('[ATS] Iteraciju skaicius: %d\n', c_count);
fprintf('[ATS] Funkcijos kvietimu skaicius: %d\n', f_count);

function a = f(x)
    a = ((x.^2-0).^2)/4-1;
end