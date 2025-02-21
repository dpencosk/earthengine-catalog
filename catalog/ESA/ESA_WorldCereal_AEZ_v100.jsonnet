local id = 'ESA/WorldCereal/AEZ/v100';
local subdir = 'ESA';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.cc_by_4_0;

local basename = std.strReplace(id, '/', '_');
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  'gee:skip_indexing': true,
  'gee:user_uploaded': true,

  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_sci
  ],
  id: id,
  title: 'ESA WorldCereal AEZ v100',
  'gee:type': ee_const.gee_type.table,
  description: |||
    The [European Space Agency (ESA) WorldCereal](https://esa-worldcereal.org/) classification system aims for product generation within one month after the end of a particular growing season. Due to the dynamic nature of these growing seasons across the globe, a global stratification into Agro-Ecological Zones (AEZ) was performed based on the global crop calendars created within the project [1]. The feature collection in this dataset contains the 106 AEZ for which WorldCereal products were generated. Each AEZ has unique crop calendars, described based on their start of season (SOS) and end of season (EOS). SOS and EOS are given in day of year (DOY). More information on the AEZ stratification and the subsequent WorldCereal product generation is described in [2].
    
    **AEZ properties:**
    - **aez_id**: the unique ID of each AEZ. WorldCereal products can be filtered based on this ID
    - **aez_groupid**: the group ID combines several unique AEZ into a group based on crop calendar similarity.
    - **tc-annual_sos**: SOS of the tc-annual season (DOY)
    - **tc-annual_eos**: EOS of the tc-annual season (DOY)
    - **tc-wintercereals_sos**: SOS of the tc-wintercereals season (DOY)
    - **tc-wintercereals_eos**: EOS of the tc-wintercereals season (DOY)
    - **tc-springcereals_sos**: SOS of the tc-springcereals season (DOY)
    - **tc-springcereals_eos**: EOS of the tc-springcereals season (DOY)
    - **tc-maize-main_sos**: SOS of the tc-maize-main season (DOY)
    - **tc-maize-main_eos**: EOS of the tc-maize-main season (DOY)
    - **tc-maize-second_sos**: SOS of the tc-maize-second season (DOY)
    - **tc-maize-second_eos**: EOS of the tc-maize-second season (DOY)
    
    Missing values of SOS and EOS indicate the absence of the respective growing season in a particular AEZ.
    
    **References:**
    [1] [WorldCereal global seasonality paper](https://doi.org/10.1080/15481603.2022.2079273)
    [2] [WorldCereal methodology and products paper](https://doi.org/10.5194/essd-2023-184)
  |||,
  license: license.id,

  links: ee.standardLinks(subdir, id) + [
    ee.link.example(id, subdir, basename + '_FeatureView'),
    ee.link.license(license.reference)],
  keywords: ['agriculture', 'borders', 'boundaries', 'crop', 'esa', 'global'],
  providers: [
    ee.producer_provider(
      'ESA WorldCereal Consortium',
      'https://esa-worldcereal.org/en'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent_global('2020-01-01T00:00:00Z', '2022-01-01T00:00:00Z'),
  summaries: {
    'gee:schema': [
      {
        name: 'aez_id',
        description: 'The unique ID of an AEZ.',
        type: ee_const.var_type.int
      },
      {
        name: 'aez_groupid',
        description: 'The group ID combines several unique AEZ into a group based on crop calendar similarity.',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-annual_sos',
        description: 'SOS of the tc-annual season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-annual_eos',
        description: 'EOS of the tc-annual season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-wintercereals_sos',
        description: 'SOS of the tc-wintercereals season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-wintercereals_eos',
        description: 'EOS of the tc-wintercereals season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-springcereals_sos',
        description: 'SOS of the tc-springcereals season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-springcereals_eos',
        description: 'EOS of the tc-springcereals season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-maize-main_sos',
        description: 'SOS of the tc-maize-main season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-maize-main_eos',
        description: 'EOS of the tc-maize-main season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-maize-second_sos',
        description: 'SOS of the tc-maize-second season (DOY).',
        type: ee_const.var_type.int
      },
      {
        name: 'tc-maize-second_eos',
        description: 'EOS of the tc-maize-second season (DOY).',
        type: ee_const.var_type.int
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'WorldCereal AEZ',
        lookat: {lon: 71.72, lat: 52.48, zoom: 1},
        table_visualization: {
        color: '000000',
        width: 1
        },
      },
      {
        display_name: 'WorldCereal AEZ',
        visualize_as: 'FeatureView',
      }
    ],
    'gee:feature_view_ingestion_params': {
      max_features_per_tile: 150,
      thinning_strategy: 'HIGHER_DENSITY',
    },
  },
  'sci:doi': '10.5194/essd-2023-184',
  'sci:citation': |||
    Van Tricht, K., Degerickx, J., Gilliams, S., Zanaga, D., Battude, M., Grosu, A., Brombacher, J., Lesiv, M., Bayas, J. C. L., Karanam, S., Fritz, S., Becker-Reshef, I., Franch, B., Mollà-Bononad, B., Boogaard, H., Pratihast, A. K., and Szantoi, Z.: WorldCereal: a dynamic open-source system for global-scale, seasonal, and reproducible crop and irrigation mapping, Earth Syst. Sci. Data Discuss. [preprint], [doi:10.5194/essd-2023-184](https://doi.org/10.5194/essd-2023-184), in review, 2023.,
  |||,
  'gee:terms_of_use': ee.gee_terms_of_use(license),
}