function root = binarySearchImprovedPlot(a, b, tol, maxIter)
    % 修正二分法示例：求解 e^(-x^2) + sin(x) = 0
    
    % 定义方程
    f = @(x) exp(-x.^2) + sin(x);
    
    % 初始化数组以保存迭代过程中的点
    iterPoints = zeros(1, maxIter);
    
    for i = 1:maxIter
        c = (a + b) / 2;
        
        % 记录当前迭代点
        iterPoints(i) = c;
        
        % 判断解是否满足收敛条件
        if abs(f(c)) < tol
            root = c;
            
            % 绘图
            plotIteration(iterPoints, f);
            
            return;
        end
        
        % 调整搜索区间
        if sign(f(c)) == sign(f(a))
            a = c;
        else
            b = c;
        end
    end
    
    error('未收敛到根，请增加迭代次数或修改搜索区间。');
end
function plotIteration(iterPoints, f)
    % 绘制迭代过程的图像
    figure;
    
    x_vals = linspace(min(iterPoints) - 1, max(iterPoints) + 1, 1000);
    y_vals = f(x_vals);
    
    plot(x_vals, y_vals, 'LineWidth', 2);
    hold on;
    plot(iterPoints, f(iterPoints), 'ro-', 'MarkerSize', 8, 'LineWidth', 1.5);
    
    title('二分法迭代过程');
    xlabel('x');
    ylabel('f(x)');
    grid on;
    legend('方程曲线', '迭代点');
    hold off;
end
root = binarySearchImprovedPlot(-1, 2, 1e-6, 50)
