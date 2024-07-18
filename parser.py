import yaml
import sys

def read_yaml(file_path):
    with open(file_path, 'r') as file:
        config = yaml.safe_load(file)
    return config

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <path_to_yaml_file>")
        sys.exit(1)
    
    yaml_file_path = sys.argv[1]
    try:
        config = read_yaml(yaml_file_path)
        # Get parameter value
        distro = config.get('dirived_from', 'default_value')  # default_value can be adjusted
        print(distro)
    except FileNotFoundError:
        print(f"Error: File not found - {yaml_file_path}")
    except yaml.YAMLError as exc:
        print(f"Error reading YAML file: {exc}")
