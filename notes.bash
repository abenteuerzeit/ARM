az role assignment list --assignee v-adrianmroz@microsoft.com --subscription 2f96ae42-240b-4228-bafa-26d8b7b03bf3
[]

az ad user show --id "v-adrianmroz@microsoft.com" --query "id" --output tsv
461413c8-8040-43ca-82f6-4e382161b0ac

az role definition list --name "Owner" --query "[].{name:name, id:id}" --output tsv
8e3af657-a8ff-443c-a75c-2fe8c4bcb635    /subscriptions/e504bc3f-d3d7-4548-81ce-692a4fe7ff93/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635

az role assignment create --assignee-object-id "461413c8-8040-43ca-82f6-4e382161b0ac" \
--role "8e3af657-a8ff-443c-a75c-2fe8c4bcb635" \
--scope "/subscriptions/e504bc3f-d3d7-4548-81ce-692a4fe7ff93/resourceGroups/{resourceGroupName}"


```bash
az role assignment list --assignee "v-adrianmroz@microsoft.com "--subscription "2f96ae42-240b-4228-bafa-26d8b7b03bf3"

userId=$(az ad user show --id "v-adrianmroz@microsoft.com" --query "id" --output tsv)

ownerRole=$(az role definition list --name "Owner" --query "[].{name:name, id:id}" --output tsv)
# 8e3af657-a8ff-443c-a75c-2fe8c4bcb635    /subscriptions/e504bc3f-d3d7-4548-81ce-692a4fe7ff93/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635

az role assignment create --assignee-object-id "$userId" \
--role "$ownerRole" \
--scope "/subscriptions/$subscription/resourceGroups/$resourceGroupName"
```

