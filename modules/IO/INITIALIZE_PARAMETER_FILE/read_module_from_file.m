function module = read_module_from_file(varargin)
    %first argument: filename
    %second argiment (optional): index
    status_info = varargin{1};
    if nargin == 1
        index=1;
    else
        index = varargin{2};
    end

    pos_list = get_range(status_info, 'MODULE');
    for i=1:size(pos_list,1)
        if status_info{pos_list(i,1)+1,2} == index 
            section = status_info(pos_list(i,1):pos_list(i,2),:);
            class_name=section{2,1};
            class_handle = str2func(section{2,1});
            module=class_handle();
            module = initalize_from_file(module, section);
            module = load_forcing_from_mat(module);
        end
    end
 
end


