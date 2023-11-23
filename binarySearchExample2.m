% 保存为 binarySearchExample2.m
function root = binarySearchExample2(a, b, tol)
    % 二分法示例：求解 e^(-x^2) + sin(x) = 0
    
    f = @(x) exp(-x.^2) + sin(x);
    
    while (b - a) > tol
        mid = (a + b) / 2;
        if f(mid) == 0
            root = mid;
            return;
        elseif f(a) * f(mid) < 0
            b = mid;
        else
            a = mid;
        end
    end
    
    root = (a + b) / 2;
    
    % 作图
    figure;
    x_vals = linspace(-2, 2, 1000);
    y_vals = exp(-x_vals.^2) + sin(x_vals);
    plot(x_vals, y_vals, 'LineWidth', 2);
    hold on;
    plot(root, f(root), 'ro', 'MarkerSize', 10);
    title('二分法示例');
    xlabel('x');
    ylabel('f(x)');
    grid on;
    hold off;
end
root = binarySearchExample2(0, 2, 1e-6);
