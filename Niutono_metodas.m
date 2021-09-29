format long
l = 0;
r = 10;
tol = 0.0001;
xi = 5;
f_count = 0;
xi_p1 = xi - ff(xi)/fff(xi);
f_count = f_count + 2;
i = 0;

while abs(xi_p1 - xi) >= tol
    xi = xi_p1;
    xi_p1 = xi - ff(xi)/fff(xi);
    f_count = f_count + 2;
    i = i + 1;
end


fprintf('Xi+1: %.10f\n', xi_p1);
fprintf('f(Xi+1): %.10f\n', f(xi_p1));
fprintf('i+1: %d\n', i+1);
fprintf('Skaiciavimu skaicius: %d\n', f_count);


function a = f(x)
    a = ((x.^2-0).^2)/4-1;
end

function b = ff(x)
    b = x.^3;
end

function c = fff(x)
    c = 3 * x.^2;
end
