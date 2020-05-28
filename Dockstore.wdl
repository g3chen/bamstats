task bamstats {
    File bam_input
    Int mem_gb

    command {
        bash /usr/local/bin/bamstats "${mem_gb}" "${bam_input}"
    }

    output {
        File bamstats_report = "bamstats_report.zip"
    }

    runtime {
        docker: "g3chen/new_account_bamstats:1.25-6"
        memory: mem_gb + "GB"
    }

    meta {
        author: "Fenglin Chen"
    }
}

workflow bamstatsWorkflow {
    call bamstats
}

