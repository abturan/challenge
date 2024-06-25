import os

def find_files(root_dir):
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename in ['.DS_Store', 'merge_files.py', '.gitignore', 'merge.py']:
                continue
            yield os.path.join(dirpath, filename)

def read_file(filepath):
    encodings = ['utf-8', 'latin-1', 'iso-8859-1']
    for encoding in encodings:
        try:
            with open(filepath, 'r', encoding=encoding) as infile:
                return infile.read()
        except UnicodeDecodeError:
            continue
    raise UnicodeDecodeError(f"Cannot decode file: {filepath}")

def create_file_tree(root_dir):
    tree = []
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename in ['.DS_Store', 'merge_files.py', '.gitignore', 'merge.py']:
                continue
            relative_path = os.path.relpath(os.path.join(dirpath, filename), root_dir)
            tree.append(relative_path)
    return '\n'.join(tree)

def merge_files(output_file_prefix, parts=1):
    file_tree = create_file_tree('.')
    all_contents = []

    # Collect all contents first
    all_contents.append("File Tree:\n")
    all_contents.append(file_tree)
    all_contents.append("\n\n")
    
    for filepath in find_files('.'):
        try:
            content = read_file(filepath)
            all_contents.append(f"File: {filepath}\n")
            all_contents.append("Code:\n")
            all_contents.append(content)
            all_contents.append("\n\n\n")
        except UnicodeDecodeError as e:
            print(e)

    # Determine the size of each part
    total_size = len(all_contents)
    part_size = total_size // parts

    # Write parts to separate files
    for i in range(parts):
        start_index = i * part_size
        if i == parts - 1:  # Ensure the last part includes any remaining content
            end_index = total_size
        else:
            end_index = (i + 1) * part_size

        part_contents = ''.join(all_contents[start_index:end_index])
        part_filename = f"{output_file_prefix}_part_{i + 1}.txt"
        with open(part_filename, 'w', encoding='utf-8') as part_file:
            part_file.write(part_contents)
        print(f"Part {i + 1} saved to {part_filename}")

if __name__ == "__main__":
    output_file_prefix = 'merged_output'
    merge_files(output_file_prefix)
    print("Files merged and saved in parts.")
