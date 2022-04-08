function y_zad = get_trajectory()
    load('yzad', 'y_trajectory');
    y_zad = y_trajectory;
    y_zad = [y_zad repmat(y_zad(:, 900), 1, 50)];
end