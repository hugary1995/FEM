function stress = getStress(strain, D)

stress = (D * strain')';

end