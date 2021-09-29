format long;

l = 0;
r = 10;
tol = 0.0001;





f_count = 0;
c_count = 0;
L = r - l;
xm = (l + r)/2;

while L >= tol
    c_count = c_count + 1;
    x1 = (l + L/4);
    x2 = (r - L/4);
    fprintf('[INFO] Iteracija:%d Intervalas[%.10f,%.10f], xm = %.10f, x1 = %.10f, x2 = %.10f\n',c_count, l, r, xm, x1, x2);
    fxm = f(xm);
    f_count = f_count + 1;
    fx1 = f(x1);
    f_count = f_count + 1;
    if fx1 < fxm
        r = xm;
        xm = x1;
        L = r - l;
    else
        fx2 = f(x2);
        f_count = f_count + 1;
        if fx2 < fxm
            l = xm;
            xm = x2;
            L = r - l;
        else
            l = x1;
            r = x2;
            L = r - l;
        end        
    end
end

minY = min([fx1, fx2, fxm]);
if minY == fx1
    minX = x1;
else
    if minY == fx2
        minX = x2;
    else
        minX = xm;
    end
end

fprintf('[ATS] Gautas minimumo taskas X asyje: %.10f\n', minX);
fprintf('[ATS] Tikslo funkcijos reiksme gautame minimumo taske: %.10f\n', minY);
fprintf('[ATS] Iteraciju skaicius: %d\n', c_count);
fprintf('[ATS] Funkcijos kvietimu skaicius: %d\n', f_count);

function a = f(x)
    a = ((x.^2-0).^2)/4-1;
end
