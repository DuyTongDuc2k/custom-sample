import argparse
import ruamel.yaml

yaml = ruamel.yaml.YAML()

def merge_yaml_files(file1, file2, output_file):
    # Load the yaml files
    with open(file1) as fp:
        data1 = yaml.load(fp)
    with open(file2) as fp:
        data2 = yaml.load(fp)
    
    # Extract the new repo entry from the second YAML file
    if 'mpp-vars' in data2 and 'distro_repos' in data2['mpp-vars']:
        new_repo = data2['mpp-vars']['distro_repos']
        if not isinstance(new_repo, list):
            new_repo = [new_repo]

        # Append the new entry to the distro_repos list in the first YAML data
        if 'mpp-vars' not in data1:
            data1['mpp-vars'] = {}
        if 'distro_repos' not in data1['mpp-vars']:
            data1['mpp-vars']['distro_repos'] = []

        data1['mpp-vars']['distro_repos'].extend(new_repo)
    
    # Merge extra_rpms from file2 into file1
    data1['mpp-vars'].setdefault('extra_rpms', [])
    data1['mpp-vars']['extra_rpms'] += data2['mpp-vars'].get('extra_rpms', [])

    # Write the updated content back to a new YAML file
    with open(output_file, 'w') as fp:
        yaml.dump(data1, fp)
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Merge two YAML files")
    parser.add_argument("file1", help="Path to the first YAML file")
    parser.add_argument("file2", help="Path to the second YAML file")
    parser.add_argument("-o", "--output", help="Path to the output YAML file (default: merged.yaml)", default="merged.yaml")
    args = parser.parse_args()

    merge_yaml_files(args.file1, args.file2, args.output)
