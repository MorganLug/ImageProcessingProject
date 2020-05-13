function [] = signal2Dto1DViz(images,dim,value, labels)
%SIGNAL2DTO1D affiche le diagramme selon une ligne ou une colonne des
%différentes images de l'array images
    if dim=="l"
        x=1:size(images{1},2);
        figure;
        hold on
        for i=1:length(images)
            image = images{i};
            plot(x,image(value, :))
        end
        lgd = legend(labels);
        title(lgd,"Signaux représentés");
        title("Représentation de l'intensité selon la ligne " + value);
        xlabel("Colonne");
        ylabel("Intensité");
        hold off
    else
        x=1:size(images{1},1);
        figure;
        hold on
        for i=1:length(images)
            image = images{i};
            plot(x,image(:, value))
        end
        lgd = legend(labels);
        title(lgd,"Signaux représentés");
        title("Représentation de l'intensité selon la Colonne " + value);
        xlabel("Ligne");
        ylabel("Intensité");
        hold off
    end
end

