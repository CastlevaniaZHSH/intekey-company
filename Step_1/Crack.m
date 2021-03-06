function [folder_count] = Crack( input_dir )
    
    input_dir_struct = dir(input_dir);

    file_count      = 1;
    folder_count    = 1;
    
    for f_index = 1:length(input_dir_struct)
        
        f_name = input_dir_struct(f_index).name;
        
        switch(input_dir_struct(f_index).isdir);
  
            case 1
                
                if((~strcmp(input_dir_struct(f_index).name,'.')) & (~strcmp(input_dir_struct(f_index).name,'..'))& (~strcmp(input_dir_struct(f_index).name,'.git')))
                    out_dir_struct(folder_count) = input_dir_struct(f_index);
                    folder_count = folder_count +1;
                    sub_floder = [input_dir,'\',input_dir_struct(f_index).name]
                    crack_sub_folder = Crack( sub_floder );
                    
                end
   
            case 0
                
                file_dir_struct(file_count) = input_dir_struct(f_index);
                file_count = file_count + 1;
                
        end
    end
        
        if (file_count ~= 1)
            
            for file_index = 1:length(file_dir_struct)
                
                old_name = file_dir_struct(file_index).name;
                
                if(strcmp(old_name(end-1:end),'.c'))
                    new_name = [old_name,'Crack'];
                    error = Shadow( input_dir ,old_name,new_name);  
                    
                end
                
                
                if(strcmp(old_name(end-1:end),'.h'))
                    new_name = [old_name,'Crack'];
                    error = Shadow( input_dir ,old_name,new_name);   
                    
                end
                
                if(strcmp(old_name(end-1:end),'.s'))
                    new_name = [old_name,'Crack'];
                    error = Shadow( input_dir ,old_name,new_name);   
                    
                end
                
                if(strcmp(old_name(end-1:end),'.m'))
                    new_name = [old_name,'Crack'];
                    error = Shadow( input_dir ,old_name,new_name);   
                    
                end
                
                if(length(old_name)>4)
                    if(strcmp(old_name(end-3:end),'.asm'))
                        new_name = [old_name,'Crack'];
                        error = Shadow( input_dir ,old_name,new_name);    
                    end
                end
            end 
        end          
end

