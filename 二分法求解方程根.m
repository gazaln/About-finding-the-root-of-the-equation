% 定义方程
f = @(x) x^2 - 4;

% 设定初始搜索区间
a = 0;  % 区间左端点
b = 3;  % 区间右端点

% 设定迭代精度
tolerance = 1e-6;

% 迭代
while (b - a) > tolerance
    c = (a + b) / 2;  % 取中点
    if f(c) == 0
        break;  % 如果中点正好是根，直接退出循环
    elseif f(a) * f(c) < 0
        b = c;  % 更新区间右端点
    else
        a = c;  % 更新区间左端点
    end
end

root = (a + b) / 2;  % 得到方程的根

disp(['方程的根为: ', num2str(root)]);
