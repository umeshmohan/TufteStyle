function [x_axis_handle, y_axis_handle] = TufteStyle(axes_handle_original)
% TufteStyle  Changes axes into a clean style described by Edward Tufte
%   [x_axis_handle, y_axis_handle] =  TufteStyle(axes_handle_original)
%   takes in a axes handle, removes box, background and adds new x and y
%   axes with an offset of 0.01 times the figure size.
%   
%   Example:
%     plot(rand(10,1));
%     original_axes_handle = gca;
%     [x_axis_handle, y_axis_handle] = TufteStyle(original_axes_handle);
%     xlabel(x_axis_handle, 'custom x label');
%     ylabel(y_axis_handle, 'custom y label');
%   

%   Author: Umesh Mohan 
%   email: umesh at heterorrhina dot in
%   Date: 2016/07/21 20:00:00 
%   Revision: 0.1.1

    figure_handle = get(axes_handle_original, 'Parent');
    original_axes_position = get(axes_handle_original,'Position');

    x_axis_position = original_axes_position - [0 0.01 0 0];
    x_axis_position(4) = eps;
    x_axis_handle = axes('Parent', figure_handle,...
                         'Position', x_axis_position,...
                         'YTick', [], 'YTickLabel', [],...
                         'box', 'off', 'tickdir', 'out');
    linkaxes([axes_handle_original x_axis_handle],'x');

    y_axis_position = original_axes_position - [0.01 0 0 0];
    y_axis_position(3) = eps;
    y_axis_handle = axes('Parent', figure_handle,...
                         'Position', y_axis_position,...
                         'XTick', [], 'XTickLabel', [],...
                         'box', 'off', 'tickdir', 'out');
    linkaxes([axes_handle_original y_axis_handle],'y');

    set(axes_handle_original,'Visible','off');
end
