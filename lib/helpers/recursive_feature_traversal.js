let allFeatureHandles = [];
expandFeature(arguments[0]);
return allFeatureHandles;

function expandFeature (feature) {
  // Don't add container features to the array
  if (feature.selectionGroup.handle ||
      feature.featureValues.length > 0 ||
      feature.featureSelectionGroups.length > 0) {
    allFeatureHandles.push(feature.handle);
  }

  feature.childFeatures.map(expandFeature);
  feature.selectionGroup.selections.map(expandSelection);
  feature.featureSelectionGroups.map(expandFSGFeatures);

  function expandSelection (selection) {
    if (selection.childFeatures && selection.childFeatures.length > 0) {
      selection.childFeatures.map(expandFeature);
    }
    //FSG selections have features, not childFeatures
    else if (selection.features && selection.features.length > 0) {
      selection.features.map(expandFeature);
    }
  }

  function expandFSGFeatures (fsg) {
    if (fsg.thenSelectionGroup &&
        fsg.thenSelectionGroup.selections &&
        fsg.thenSelectionGroup.selections.length &&
        fsg.thenSelectionGroup.handle !== feature.selectionGroup.handle) {
      fsg.thenSelectionGroup.selections.map(expandSelection);
    }
  }
}