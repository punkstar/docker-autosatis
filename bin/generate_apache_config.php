<?php

require_once __DIR__ . '/../vendor/autoload.php';

list(, $template_file, $output_file) = $argv;

if (empty($template_file)) {
    trigger_error("No template file specified");
}

if (empty($output_file)) {
    trigger_error("No output file specified");
}

printf("Reading from template at %s..\n", $template_file);

$template_contents = file_get_contents($template_file);

printf("Template:\n\n%s\n", $template_contents);

$loader = new Twig_Loader_Array([
    'apache_conf' => $template_contents
]);

$twig = new Twig_Environment($loader);

$generated_template = $twig->render('apache_conf', [
    'virtual_host' => $_ENV['VIRTUAL_HOST'],
    'api_keys'     => explode(',', $_ENV['API_KEYS']),
]);

printf("Generated:\n\n%s\n", $generated_template);

file_put_contents($output_file, $generated_template);

printf("Written to %s\n", $output_file);
printf("Done.\n");
