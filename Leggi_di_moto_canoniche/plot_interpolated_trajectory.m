function plot_interpolated_trajectory(q_traj_t, q_traj_p, t, q_targhet, y_label)
    figure('Name','Traiettoria nello spazio dei giunti');
    plot(q_traj_t, q_traj_p);
    xlabel("tempo")
    ylabel(y_label)
    hold on
    
    for j=1:size(q_targhet,1)
        for i=1:6
            %plot(t(j), q_targhet(j,:),'o')
            plot(t(j), q_targhet(j,:),'')
        end
    end
    legenda = legend({'J1','J2','J3','J4','J5','J6',})
    newPosition=[0.95,0.4,0.025,0.2]
    set(legenda, 'Position',newPosition)
end
