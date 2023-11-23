% 保存为 compressionIterationExample2.m
function root = compressionIterationExample2(x0, n)
    % 压缩函数迭代法示例：求解 e^(-x^2) + sin(x) = 0
    
    f = @(x) exp(-x.^2) + sin(x);  % 修改这里，使其能够接受向量
    x = x0;  % 初始值
    
    for i = 1:n
        x = f(x);
    end
    
    root = x;
    
    % 作图
    figure;
    x_vals = linspace(-2, 2, 1000);
    y_vals = exp(-x_vals.^2) + sin(x_vals);
    plot(x_vals, y_vals, 'LineWidth', 2);
    hold on;
    plot(root, f(root), 'ro', 'MarkerSize', 10);
    title('压缩函数迭代法示例');
    xlabel('x');
    ylabel('f(x)');
    grid on;
    hold off;
end
root = compressionIterationExample2(1, 10);
